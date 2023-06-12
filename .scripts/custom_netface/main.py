import psutil
import socket

from cutepy import HEX

interfaces = psutil.net_if_stats()


class Colors:

    interface = HEX.print("BEA9DE")
    mtu = HEX.print("a9cbde")
    speed = HEX.print("a9deb2")
    network = HEX.print("dea9a9")
    netmask = HEX.print("decea9")
    ipv = HEX.print("d9ecb3")
    broadcast = HEX.print("9dbbc6")
    reset = HEX.reset


class Interfaces:

    def display():
        for interface, stats in interfaces.items():

            addrs = psutil.net_if_addrs().get(interface, [])
            for addr in addrs:
                if addr.family == socket.AF_INET:
                    print(f"""
╭─ {Colors.interface}{interface}{Colors.reset}
╰─ {Colors.network}Network Information{Colors.reset}
    ╭─ {Colors.ipv}IPv4{Colors.reset}      {addr.address}
    │  {Colors.netmask}Netmask{Colors.reset}   {addr.netmask}
    ╰─ {Colors.broadcast}Broadcast{Colors.reset} {addr.broadcast or 'None'}""")
                elif addr.family == socket.AF_INET6:
                    print(f"""    ╭─ {Colors.ipv}IPv6{Colors.reset}      {addr.address}
    ╰─ {Colors.netmask}Netmask{Colors.reset}   {addr.netmask}""")


Interfaces.display()
print("")
