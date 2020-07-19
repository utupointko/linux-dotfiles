import requests
import sys

def get_icon(icon_id):
    switcher = {
        "01d": "",
        "01n": "",
        "02d": "",
        "02n": "",
        "03d": "",
        "03n": "",
        "04d": "",
        "04n": "",
        "09d": "",
        "09n": "",
        "10d": "",
        "10n": "",
        "11d": "",
        "11n": "",
        "13d": "",
        "13n": "",
        "50d": "",
        "50n": "",
    }
    return switcher.get(icon_id, "") 
    

def get_weather(location, api_key):
    url = "https://api.openweathermap.org/data/2.5/weather?q={}&units=metric&appid={}".format(location, api_key)
    r = requests.get(url)
    return r.json()

def main():
    if len(sys.argv) != 2:
        exit("Usage: {} LOCATION".format(sys.argv[0]))
    location = sys.argv[1] 
    
    api_key = "a2ba6d49a858e70ab9bbbe0babb25fc2"
    weather = get_weather(location, api_key)
    icon_id =  weather['weather'][0]['icon']

    current_weather_icon = get_icon(icon_id)
    current_weather_temp = weather['main']['temp']
    current_weather_description = weather['weather'][0]['description']

    print(current_weather_icon, str(current_weather_temp) + "˚C")

if __name__ == '__main__':
    main()