import cv2
from ultralytics import YOLO

# modell auswählen
model = YOLO("yolo11n.pt")

# standart cam auswählen
camera = cv2.VideoCapture(0)
print("starte cam")

if not camera.isOpened():
    print("fehler!")
    exit()
print("cam gestartet")

print("starte erkennung")

# erkennung findet hier statt
while True: 
    ret, frame = camera.read()
    if not ret:
        print("fehler beim starten von erkennung ")
        break

    results = model(frame)

    # YOLO anzeige
    if results:
        annotated_frame = results[0].plot()
        cv2.imshow("Bilderkennung", annotated_frame)
    else:
        cv2.imshow("Bilderkennung", frame)

    #schleife stoppen wenn q gedrückt (im fenster), 
    if cv2.waitKey(1) & 0xFF == ord('q'):
        print("Q gedrückt! Stoppe erkennung")
        break

camera.release()
cv2.destroyAllWindows()