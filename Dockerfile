FROM dlord/minecraft:java8
MAINTAINER Bruno MATEU mateubruno@gmail.com

ENV FTB_REVELATION_URL https://www.feed-the-beast.com/projects/ftb-revelation/files/2545327/download
ENV LAUNCHWRAPPER net/minecraft/launchwrapper/1.12/launchwrapper-1.12.jar

RUN curl -SL $FTB_REVELATION_URL -o /tmp/revelation.zip && \
	unzip /tmp/revelation.zip -d /opt/minecraft && \
	mkdir -p /opt/minecraft/$(dirname libraries/${LAUNCHWRAPPER}) && \
	curl -S https://libraries.minecraft.net/$LAUNCHWRAPPER -o /opt/minecraft/libraries/$LAUNCHWRAPPER && \
	rm -rf /tmp/*


VOLUME /opt/minecraft/

ENV MINECRAFT_VERSION 1.12.2
ENV MINECRAFT_OPTS -server -Xmx2048m -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=5 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10
ENV MINECRAFT_STARTUP_JAR FTBserver-1.12.2-14.23.2.2627-universal.jar
