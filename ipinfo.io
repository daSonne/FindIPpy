import requests
import json

def get_ip_and_location():
    try:
        response = requests.get('https://ipinfo.io/json')
        data = response.json()
        ip = data.get('ip')
        city = data.get('city')
        region = data.get('region')
        country = data.get('country')
        return ip, city, region, country
    except Exception as e:
        print(f"Error: {e}")
        return None, None, None, None

def create_html_file(ip, city, region, country):
    html_content = f"""
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>IP and Location Info</title>
    </head>
    <body>
        <h1>Your IP and Location Information</h1>
        <p><strong>IP Address:</strong> {ip}</p>
        <p><strong>City:</strong> {city}</p>
        <p><strong>Region:</strong> {region}</p>
        <p><strong>Country:</strong> {country}</p>
    </body>
    </html>
    """
    with open('index.html', 'w') as f:
        f.write(html_content)

if __name__ == "__main__":
    ip, city, region, country = get_ip_and_location()
    if ip:
        create_html_file(ip, city, region, country)
        print("HTML file created: index.html")
    else:
        print("Failed to retrieve IP and location information.")
