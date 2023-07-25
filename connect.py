import subprocess

def connect_to_wifi(ssid):
    try:
        # Scan for available Wi-Fi networks
        scan_result = subprocess.run(["iwctl", "station", "wlan0", "scan"], capture_output=True, text=True)
        if scan_result.returncode != 0:
            print("Failed to scan for Wi-Fi networks.")
            return False
        
        # Check if the provided SSID is available in the scan results
        if ssid not in scan_result.stdout:
            print(f"Wi-Fi network with SSID '{ssid}' not found.")
            return False
        
        # Ask the user for the Wi-Fi password
        password = input("Enter the Wi-Fi password: ")

        # Connect to the Wi-Fi network with the provided password
        connect_command = f"connect {ssid} --passphrase {password}"
        connect_result = subprocess.run(["iwctl", "station", "wlan0", "connect", connect_command], capture_output=True, text=True)

        if connect_result.returncode == 0:
            print(f"Successfully connected to Wi-Fi network '{ssid}'.")
            return True
        else:
            print("Failed to connect to the Wi-Fi network.")
            print(connect_result.stderr)
            return False

    except Exception as e:
        print(f"Error: {e}")
        return False

if __name__ == "__main__":
    wifi_ssid = "Shaquib"
    if connect_to_wifi(wifi_ssid):
        print("Wi-Fi connection successful!")
    else:
        print("Wi-Fi connection failed.")
