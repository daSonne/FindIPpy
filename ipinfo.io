import requests

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

def create_html_file_from_template(ip, city, region, country, template_file, output_file):
    with open(template_file, 'r') as f:
        html_template = f.read()
    
    html_content = html_template.format(ip=ip, city=city, region=region, country=country)
    
    with open(output_file, 'w') as f:
        f.write(html_content)

if __name__ == "__main__":
    ip, city, region, country = get_ip_and_location()
    if ip:
        create_html_file_from_template(ip, city, region, country, 'template.html', 'index.html')
        print("HTML file created: index.html")
    else:
        print("Failed to retrieve IP and location information.")

