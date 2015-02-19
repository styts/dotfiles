# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status

status = Status(standalone=True)

status.register("clock",
    format="%a %-d %b %X",)

status.register("load")

status.register("temp",
    format="{temp:.0f}°C",)

status.register("battery",
    format="{status}@{consumption:.0f}W [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=5,
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
    },)

status.register("wireless",
    interface="wlp3s0",
    format_up="{v4} {quality:02.0f}%",)

status.register("disk",
    path="/",
    # format="{used}/{total}G [{avail}G]",)
    format="{avail}G",)

status.register("pulseaudio",
    format="♪{volume}",)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
status.register("mpd",
    format="{status} {artist} - {title} ({album})",
    status={
        "pause": "▷",
        "play": "▶",
        "stop": "◾",
    },)

status.run()
