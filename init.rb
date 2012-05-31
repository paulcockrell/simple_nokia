# coding: utf-8
require 'lazy_nokia_maps'
require 'lazy_nokia_maps/layout_helper'
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :nokia_maps => ["nokiamaps"]
ActionView::Base.send :include, LazyNokiaMaps::LayoutHelper
