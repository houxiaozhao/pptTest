#!/bin/bash

# 指定要处理的PPT文件
file="/Users/axyw/Documents/project/cdtools.click/pptTest/224693.pptx"

echo "----------------------------------------"
echo "处理文件: $file"

filename=$(basename -- "$file")
dirname=$(dirname -- "$file")
name="${filename%.*}"

echo "文件名: $filename"
echo "目录: $dirname"
echo "基础名: $name"

# 转换为PDF
echo "正在转换为PDF..."
/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to pdf "$file" --outdir "$dirname"

# 检查PDF是否存在
echo "检查PDF文件..."
ls -l "$dirname/$name.pdf"

echo "正在转换PDF为JPG..."
magick -density 150 "${dirname}/${name}.pdf" -append -quality 50 "${dirname}/${name}_all_pages.jpg"

echo "正在转换PDF为JPG..."
magick -density 150 "${dirname}/${name}.pdf[0]" -quality 50 "${dirname}/${name}_first_page.jpg"

# 检查生成的文件
echo "检查生成的文件..."
ls -l "$dirname"

echo "完成转换: $file"
echo "----------------------------------------"