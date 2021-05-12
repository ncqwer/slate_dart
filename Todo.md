# What
本项目完成的ts项目（[slate](https://github.com/ianstormtaylor/slate)）的dart化。

# Why
主要目的是在移动端使用网页端产生的slate数据格式来绘制移动端页面。

# How
目前分为4部分实现：
  - slate_dart/core: 对标slate，提供对slate对象的基础操作。
  - slate_dart/widget: 对标slate-react, 提供对flutter端的绑定工作
  - slate_dart/plugin: 在`slate_dart/core`和`slate_dart/widget`的基础上，提供自定义选项
  - slate_dart/herbart_preset: 对标`herbart-editor`,提供开箱即用的系统。

# Roadmap

## slate_dart/core
  - 整理xmind文件
  - 选取合适的dart特性实现