virsh list --all |awk '{print $2}'|grep -v Name |xargs -I% -t bash -c  'virsh destroy % && virsh undefine --remove-all-storage %'

