# Programmierumgebung

Ubuntu 24.04, ROS 2 Jazzy und Python 3.12. Als Bildverarbeitung ist OpenCV gewählt. Die Kamera wird über den RealSense-ROS-Treiber eingebunden.

## Start

Öffne ein Bash-Terminal im geklonten Repository, in dem `activate.sh` und `main.py` liegen.

```bash
source activate.sh
python main.py
```

`main.py` enthält ausschließlich Imports. Beim Ausführen werden die Imports geprüft. Den eigenen ROS-Node implementiert ihr dort selbst, einschließlich `rclpy.init()`, Node-Klasse, `rclpy.spin()` und Shutdown.

## Fehlende Systempakete installieren

```bash
bash prerequisites.sh
```

Dabei fragt sudo im eigenen Terminal nach dem Passwort. Das Skript ergänzt unter anderem RealSense-Treiber, venv-Unterstützung und pip. Es kann erneut ausgeführt werden. Anschließend `source activate.sh` verwenden.

Die angelegte `.venv` verwendet Python 3.12 und die vorhandenen Systembibliotheken über `--system-site-packages`. ROS und OpenCV sind dadurch gemeinsam nutzbar. Bis zur Ausführung des Installationsskripts ist die Umgebung ohne pip angelegt. NumPy und OpenCV werden passend zur Ubuntu-/ROS-Installation über apt verwaltet.

Eigene zusätzliche Python-Pakete in `requirements.txt` eintragen und nach der Installation von pip mit `python -m pip install -r requirements.txt` installieren.

## Kamera starten

Nach Installation des Treibers in einem aktivierten Terminal:

```bash
ros2 launch realsense2_camera rs_launch.py enable_color:=true enable_depth:=true align_depth.enable:=true
```

## Stand bei Einrichtung

- Vorhanden: ROS 2 Jazzy, OpenCV, NumPy, cv_bridge, tf2, message_filters, image_geometry, RViz, robot_state_publisher, Gazebo-Anbindung und TurtleBot3-Simulation.
- Noch zu installieren: RealSense-ROS-Treiber, python3.12-venv und pip. Die automatische sudo-Installation benötigte ein Passwort.
- Kamerabetrieb und Simulation wurden nicht gestartet oder mit Hardware getestet.

Die Paketnamen und die Python-Systeminterpreter-Wahl folgen den offiziellen Anleitungen.

- https://github.com/realsenseai/realsense-ros
- https://docs.ros.org/en/jazzy/How-To-Guides/Using-Python-Packages.html
