@echo off

	TITLE Quick Start

	COLOR 3E

	cd %~dp0
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] ���ڹ�����������Ӧ�� . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	cd eureka-server
	
	call mvn -e -ff clean package -Dmaven.test.skip=true
	
	cd target
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] �������� Eureka ������ Peer1 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	start "Eureka Peer1" /min cmd /T:3E /k "java -jar eureka-server-0.0.1-SNAPSHOT.jar"
	
	ping -n 5 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] �������� Eureka ������ Peer2 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	start "Eureka Peer2" /min cmd /T:3E /k "java -jar -Dspring.profiles.active=peer2 eureka-server-0.0.1-SNAPSHOT.jar"
	
	ping -n 5 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] �������� Eureka ������ Peer3 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	start "Eureka Peer3" /min cmd /T:3E /k "java -jar -Dspring.profiles.active=peer3 eureka-server-0.0.1-SNAPSHOT.jar"
	
	ping -n 3 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] ���ڹ����ͻ���Ӧ�� . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	cd ../../order-service
	
	call mvn -e -ff clean package -Dmaven.test.skip=true
	
	cd target
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] ���������ͻ���Ӧ�� Client1 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	start "Provider Client1" /min cmd /T:3E /k "java -jar order-service-0.0.1-SNAPSHOT.jar"
	
	ping -n 5 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] ���������ͻ���Ӧ�� Client2 . . .
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	
	start "Provider Client2" /min cmd /T:3E /k "java -Dspring.profiles.active=client2 -jar order-service-0.0.1-SNAPSHOT.jar"
	
	ping -n 20 127.1 > nul
	
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]
	echo [INFO] ������ϣ�
	echo [INFO]
	echo [INFO] http://localhost:8761
	echo [INFO]
	echo [INFO] http://localhost:8762
	echo [INFO]
	echo [INFO] http://localhost:8763
	echo [INFO]
	echo [INFO] ------------------------------------------------------------------------
	echo [INFO]

pause