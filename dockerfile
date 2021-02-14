# OS
FROM centos:7
# Set version label
LABEL maintainer="github.com/Dofamin"
LABEL image=Sonarr
LABEL OS=Centos7
# Update system packages:
RUN yum -y update > /dev/null 2>&1;\
# Install dependencies.
    yum -y install epel-release yum-utils > /dev/null 2>&1;\
    rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF" > /dev/null 2>&1;\
    yum-config-manager --add-repo http://download.mono-project.com/repo/centos/ > /dev/null 2>&1;\
    yum -y install wget mediainfo libzen libmediainfo curl gettext mono-core mono-devel sqlite.x86_64 > /dev/null 2>&1 ;\
# If you have issues or you started from a very base (minimal) install, you may also need
    yum -y install wget git par2cmdline p7zip unrar unzip tar gcc python-feedparser python-configobj python-cheetah python-dbus python-devel libxslt-devel yum-utils > /dev/null 2>&1;\    
# Add a user for Sonarr to use:
    useradd sonarr   > /dev/null 2>&1;\
# Download, extract and move Sonarr
    wget -q -O /tmp/Sonarr.tar.gz http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz  > /dev/null 2>&1;\
    tar -xvf /tmp/Sonarr.tar.gz -C /opt/ > /dev/null 2>&1;\
    rm -f /tmp/Sonarr.tar.gz > /dev/null 2>&1;\
    mkdir /Sonarr > /dev/null 2>&1;\
    mkdir /Sonarr/bin > /dev/null 2>&1;\
    mkdir /Sonarr/data > /dev/null 2>&1;\
    mv /opt/NzbDrone/* /Sonarr/bin/ > /dev/null 2>&1;\
    rm -rf /opt/NzbDrone/ > /dev/null 2>&1;\
# Change ownership of the install directory
    chown -R sonarr:sonarr /Sonarr/ > /dev/null 2>&1;\
# Clean up
    yum -y autoremove > /dev/null 2>&1 ;\
    yum clean all > /dev/null 2>&1;\
    rm -rf /var/cache/yum > /dev/null 2>&1 
# Expose Ports:
EXPOSE 8989/tcp 8989/udp
# CMD
CMD ["su","-","sonarr","-c","/usr/bin/mono --debug /Sonarr/bin/NzbDrone.exe -nobrowser -data /Sonarr/data"]
