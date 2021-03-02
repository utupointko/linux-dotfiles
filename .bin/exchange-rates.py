"""Currency (KGS) exchange rates

This script allows user to print to the console
exchange rates to kyrgyz soms of given currency
from nbkr.kg.

This tool accepts white space separated currency
ISOCodes (eur usd huf).

Script requires that `requests` be installed within the Python
environment you are running this script in.

"""

import argparse
import xml.etree.ElementTree as ElementTree

import requests


def get_root_from_xml(url):
    r = requests.get(url)
    return ElementTree.fromstring(r.content)


def get_daily_exchange_rates():
    root = get_root_from_xml('https://www.nbkr.kg/XML/daily.xml')
    return {child.attrib['ISOCode']: child[1].text for child in root}


def get_weekly_exchange_rates():
    root = get_root_from_xml('https://www.nbkr.kg/XML/weekly.xml')
    return {child.attrib['ISOCode']: child[2].text for child in root}


def print_exchange_rates(currency_list):
    rates = get_daily_exchange_rates().copy()
    rates.update(get_weekly_exchange_rates())
    for currency in currency_list:
        c = currency.upper()
        print(f'{c} : {rates.get(c)}', end=' ')
    print()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-c', '--currency',
                        required=True,
                        nargs='+',
                        help='show exchange rates of given currencies'
                        )
    args = parser.parse_args()
    print_exchange_rates(args.currency)


if __name__ == '__main__':
    main()
