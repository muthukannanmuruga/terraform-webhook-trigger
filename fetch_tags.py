import sys
import requests
import json

def main(app_id):
    if not app_id:
        print(json.dumps({"success": "false", "tags": "{}"}))
        return

    url = f"http://localhost:3000/api/app/v1/{app_id}"
    response = requests.get(url)
    
    if response.status_code == 200:
        tags = response.json()  # Adjust based on actual response structure
        
        # Convert all values to strings
        tags_str = {k: str(v) for k, v in tags.items() if isinstance(v, (str, int, float))}
        
        # Print the output in a format Terraform expects (flat map)
        print(json.dumps({"success": "true", "tags": json.dumps(tags_str)}))
    else:
        print(json.dumps({"success": "false", "tags": "{}"}))

if __name__ == "__main__":
    app_id = sys.argv[1] if len(sys.argv) > 1 else None
    main(app_id)
