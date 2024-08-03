#!/usr/bin/env python3

import PyPDF2
from fpdf import FPDF
import os
from PIL import Image


def merge_pdfs(pdf_list, output):
    pdf_writer = PyPDF2.PdfWriter()

    for pdf in pdf_list:
        pdf_reader = PyPDF2.PdfReader(pdf)
        for page in range(len(pdf_reader.pages)):
            pdf_writer.add_page(pdf_reader.pages[page])

    with open(output, 'wb') as out:
        pdf_writer.write(out)


def image_to_pdf_single(image_path, pdf_path):
    pdf = FPDF()

    with Image.open(image_path) as img:
        img_width_px, img_height_px = img.size
        img_dpi = img.info.get('dpi', (300, 300))[0]

    img_width_mm = img_width_px / img_dpi * 25.4
    img_height_mm = img_height_px / img_dpi * 25.4

    print(img_width_mm)

    page_width = 210
    page_height = 297

    scale_width = page_width / img_width_mm
    scale_height = page_height / img_height_mm
    scale = min(scale_width, scale_height)

    new_width_mm = img_width_mm * scale
    new_height_mm = img_height_mm * scale

    x = (page_width - new_width_mm) / 2
    y = (page_height - new_height_mm) / 2

    pdf.add_page()
    pdf.image(image_path, x=x, y=y, w=new_width_mm, h=new_height_mm)

    pdf.output(pdf_path)

def image_to_pdf_multiple(mult_img, pdf_path):
    pdf = FPDF()

    for image_path in mult_img:
        with Image.open(image_path) as img:
            img_width_px, img_height_px = img.size
            img_dpi = img.info.get('dpi', (300, 300))[0]

        img_width_mm = img_width_px / img_dpi * 25.4
        img_height_mm = img_height_px / img_dpi * 25.4

        print(img_width_mm)

        page_width = 210
        page_height = 297

        scale_width = page_width / img_width_mm
        scale_height = page_height / img_height_mm
        scale = min(scale_width, scale_height)

        new_width_mm = img_width_mm * scale
        new_height_mm = img_height_mm * scale

        x = (page_width - new_width_mm) / 2
        y = (page_height - new_height_mm) / 2

        pdf.add_page()
        pdf.image(image_path, x=x, y=y, w=new_width_mm, h=new_height_mm)

    pdf.output(pdf_path)

if __name__ == "__main__":

    main_choice = input("Enter 1 for pdf-merging OR 2 for img->pdf: ")

    if(main_choice == '1'):
        mult_pdf = []
        i = 1

        while True:
            image_name = input(f"Enter {i} pdf name/path pls (or type done) -> ")
            if image_name.lower() == 'done':
                break
            else:
                if os.path.exists(image_name):
                    mult_pdf.append(image_name)
                    i += 1
                else:
                    print("Invalid pdf name/path.")

        output_path = input("Enter merged pdf save loc/name pls -> ")
        merge_pdfs(mult_pdf,output_path)
        print(f"Successfully saved merged-pdf to {output_path}.")

    elif(main_choice == '2'):
        option = input("1 for single image, 2 for multiple images: ")

        if option == '1':
            image_path = input("Enter image path/name pls -> ")
            pdf_path = input("Enter pdf save loc/name pls -> ")

            if os.path.exists(image_path):
                image_to_pdf_single(image_path, pdf_path)
                print(f"Converted {image_path} to {pdf_path}.")
            else:
                print("Invalid path/file name.")

        elif option == '2':
            mult_img = []
            i = 1

            while True:
                image_name = input(f"Enter {i} image name/path pls (or type done) -> ")
                if image_name.lower() == 'done':
                    break
                else:
                    if os.path.exists(image_name):
                        mult_img.append(image_name)
                        i += 1
                    else:
                        print("Invalid image name/path.")

            pdf_path = input("Enter pdf save loc/name pls -> ")

            image_to_pdf_multiple(mult_img, pdf_path)
            print(f"Successfully saved pdf to {pdf_path}.")
        
        else:
            print("Invalid choice")

    else:
        print("Invalid choice")
