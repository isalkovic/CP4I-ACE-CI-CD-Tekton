FROM ibmcom/ace-server:11.0.0.10-r3-eus-20201113-040256-amd64
#FROM cp.icr.io/cp/appc/ace-server-prod@sha256:b218a2daec93b8e4555f58a3fd658c3d7b30893b6bff69ec92f81d946c4d1ab3
ENV LICENSE accept
COPY PingService /home/aceuser/PingService
RUN mkdir /home/aceuser/bars
RUN source /opt/ibm/ace-11/server/bin/mqsiprofile
RUN /opt/ibm/ace-11/server/bin/mqsipackagebar -a bars/PingService.bar -k PingService
RUN ace_compile_bars.sh
RUN chmod -R 777 /home/aceuser/ace-server/run/PingService