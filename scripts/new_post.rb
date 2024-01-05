# ファイル操作ライブラリー
require 'fileutils'
require 'time'

LAYOUT = "post"
DIR = File.join(Dir.pwd, "_posts")

# 現在時
current_time = Time.now

# 変換
formatted_time = current_time.strftime("%Y-%m-%d %H:%M:%S")
filename_prefix = formatted_time.slice(0, 10)

# パラメータチェク
if ARGV.length < 2
    puts "please enter title and subtitle"
    exit
end

# タイトルとサブタイトルの取得
title = ARGV[0]
subtitle = ARGV[1]

# 内容生成
post_template = <<~TEMPLATE
---
layout: #{LAYOUT}
title: #{title}
subtitle: #{subtitle}
date: #{formatted_time} +0900
category: 
tag: 
---

# {{ page.title }}

## {{ page.subtitle }}

TEMPLATE


file_path = File.join(DIR, "#{filename_prefix}-#{title}.md")

if File.exist?(file_path)
    puts "file is already exist!"
    exit
end

File.open(file_path, 'w') do |file|
    file.write(post_template)
end 
