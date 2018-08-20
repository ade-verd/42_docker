#! /bin/bach

set -o xtrace

# gitlab-ctl start
/opt/gitlab/embedded/bin/runsvdir-start &
gitlab-ctl reconfigure
tail -f /dev/null