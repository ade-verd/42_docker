FROM ubuntu:18.04

RUN apt-get -qq update && apt-get -qq upgrade -y && apt-get -qq install -y \
	curl openssh-server ca-certificates postfix ufw tzdata \
	&& curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash \
	&& apt-get install -y gitlab-ce \
	&& apt-get autoremove \
	&& apt-get clean

EXPOSE 80 443 22
# Cf. gitlab architecture
# HTTPS: TCP 80
# HTTPS: TCP 443
# SSH: TCP 22

COPY entrypoint.sh /root

ENTRYPOINT ["sh", "/root/entrypoint.sh"]

# Sources:
# https://about.gitlab.com/installation/#ubuntu
# https://docs.gitlab.com/ce/development/architecture.html
# https://packages.gitlab.com/gitlab/gitlab-ce/install
# https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2229