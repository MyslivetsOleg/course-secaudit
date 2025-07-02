import json
import sys

if len(sys.argv) != 3:
    print(f"Usage: {sys.argv[0]} <tf_output.json> <group_name>")
    sys.exit(1)

tf_output_path = sys.argv[1]
group_name = sys.argv[2]

with open(tf_output_path) as f:
    data = json.load(f)

ips = data['vm_ip_lan_subnet']['value']

print(f"[{group_name}]")
print(ips)
