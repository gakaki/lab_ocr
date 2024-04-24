import cv2
from ultralytics import YOLO
import numpy as np
import easyocr

# from paddleocr import PaddleOCR, draw_ocr

# ocr         = PaddleOCR(use_angle_cls=True, lang='en', use_gpu=False)
model = YOLO("yolo_lab.pt")
classNames = ["pv-sv", "rpm", "times", "warning-led"]
reader = easyocr.Reader(['en'])


def getOCR(name, im, coors):
    x, y, w, h = int(coors[0]), int(coors[1]), int(coors[2]), int(coors[3])
    im = im[y:h, x:w]

    frame = cv2.cvtColor(im, cv2.COLOR_RGB2GRAY)
    detect_text = []
    results = reader.readtext(frame, detail=1, allowlist='0123456789.')

    for (bbox, text, prob) in results:
        if prob > 0.5:
            # bbox是边界框，text是识别的文本，prob是置信度
            print(f"Text:  {text}, Confidence: {prob}")
            print(f"Class: {name}:", bbox, text, prob)
            detect_text.append(text)

    return {
        "msg": f"{name}-{','.join(detect_text)}",
        "class": name,
        "txt": ','.join(detect_text)
    }


def detect_than_ocr(pilImage):
    image_np_array = np.array(pilImage)
    bgr_image = cv2.cvtColor(image_np_array, cv2.COLOR_RGB2BGR)

    # 进行180度翻转
    # frame = cv2.flip(frame, -1)
    results = model(bgr_image)
    result = results[0]
    bboxes = np.array(result.boxes.xyxy, dtype="int")
    classes = np.array(result.boxes.cls, dtype="int")

    ocr_lines = []
    for cls, bbox in zip(classes, bboxes):
        (x, y, x2, y2) = bbox
        cv2.rectangle(bgr_image, (x, y), (x2, y2), (0, 0, 225), 2)
        name = classNames[int(cls)]
        res_map = getOCR(name, bgr_image, bbox)

        label = res_map["msg"]
        if label:
            # cv2.putText(frame, str(cls), (x, y - 5), cv2.FONT_HERSHEY_PLAIN, 2, (0, 0, 225), 2)
            cv2.putText(bgr_image, label, (x, y - 5), cv2.FONT_HERSHEY_PLAIN, 2, (0, 0, 225), 2)

        ocr_lines.append(res_map)

    return [ocr_lines, bgr_image]


def save_ocred_image(bgr_image):
    if bgr_image is None:
        print("Error: Could not load image.")
    else:
        cv2.imwrite('detect_ocr_res.jpg', bgr_image)  # 替换为你想要保存的路径和文件名
        print("Image saved successfully.")

