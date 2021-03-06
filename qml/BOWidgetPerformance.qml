/* Copyright (C) 2017 Benjamin Isbarn.

   This file is part of BeneOverlay.

   BeneOverlay is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   BeneOverlay is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with BeneOverlay.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Dialogs 1.2



BOGroupBox {
  id: root

  name: "Performance Settings"

  property var data_ref_enabled: data_ref_manager.getDataRef("widget/performance/enabled")
  property var data_ref_custom_style: data_ref_manager.getDataRef("widget/performance/custom_style")
  property var data_ref_icon_enabled: data_ref_manager.getDataRef("widget/performance/icon_enabled")
  property var data_ref_icon_size: data_ref_manager.getDataRef("widget/performance/icon_size")
  property var data_ref_primary_color: data_ref_manager.getDataRef("widget/performance/primary_color")
  property var data_ref_secondary_color: data_ref_manager.getDataRef("widget/performance/secondary_color")
  property var data_ref_primary_font: data_ref_manager.getDataRef("widget/performance/primary_font")
  property var data_ref_secondary_font: data_ref_manager.getDataRef("widget/performance/secondary_font")
  property var data_ref_fps_buffer_size: data_ref_manager.getDataRef("widget/performance/fps_buffer_size")


  BOSwitch {
    id: enabled_switch

    anchors.top: parent.top
    anchors.left: parent.left

    name: "Enabled"
    description: "Enable this widget"
    data_ref: root.data_ref_enabled
  }

  BOSwitch {
      id: fps_enabled_switch

      anchors.top: enabled_switch.bottom
      anchors.left: parent.left

      name: "Show FPS"
      description: "Enable FPS readout."
      data_ref: data_ref_manager.getDataRef("widget/performance/fps_enabled")

      visible: enabled_switch.checked
  }

  BOSwitch {
      id: vas_enabled_switch

      anchors.top: fps_enabled_switch.bottom
      anchors.left: parent.left

      name: "Show VAS"
      description: "Enable VAS readout."
      data_ref: data_ref_manager.getDataRef("widget/performance/vas_enabled")

      visible: enabled_switch.checked
  }

  BOSpinBox {
    id: fps_buffer_size_spin_box

    anchors.top: vas_enabled_switch.bottom
    anchors.left: parent.left

    name: "FPS Buffer Size"
    data_ref: root.data_ref_fps_buffer_size
    from: 1

    visible: fps_enabled_switch.checked && fps_enabled_switch.visible
  }

  BOSwitch {
    id: custom_style_switch

    anchors.top: fps_buffer_size_spin_box.visible? fps_buffer_size_spin_box.bottom : vas_enabled_switch.bottom
    anchors.left: parent.left

    name: "Custom Style"
    description: "Enable custom styling for this widget"
    data_ref: root.data_ref_custom_style

    visible: enabled_switch.checked
  }

  BOSwitch {
    id: icon_enabled_switch

    anchors.top: custom_style_switch.bottom
    anchors.left: parent.left

    name: "Icon Enabled"
    description: "Enable the icon for this widget"
    data_ref: root.data_ref_icon_enabled

    visible: custom_style_switch.checked && custom_style_switch.visible
  }

  BOSpinBox {
    id: icon_size_spin_box

    anchors.top: icon_enabled_switch.bottom
    anchors.left: parent.left

    name: "Icon Size"
    data_ref: root.data_ref_icon_size
    from: 0

    visible: icon_enabled_switch.checked && icon_enabled_switch.visible
  }

  BOColorSelector {

    id: primary_color_color_selector

    anchors.top: icon_size_spin_box.visible? icon_size_spin_box.bottom : icon_enabled_switch.bottom
    anchors.left: parent.left

    name: "Primary Color"
    data_ref: data_ref_primary_color

    visible: custom_style_switch.checked && custom_style_switch.visible

  }

  BOColorSelector {

    id: secondary_color_color_selector

    anchors.left: primary_color_color_selector.right
    anchors.verticalCenter: primary_color_color_selector.verticalCenter

    name: "Secondary Color"
    data_ref: data_ref_secondary_color

    visible: custom_style_switch.checked && custom_style_switch.visible

  }

  BOFontSelector {

    id: primary_font_font_selector

    anchors.top: secondary_color_color_selector.bottom
    anchors.left: parent.left

    name: "Primary Font"

    data_ref: root.data_ref_primary_font

    visible: custom_style_switch.checked && custom_style_switch.visible
  }

  BOFontSelector {
    id: secondary_font_font_selector

    anchors.left: primary_font_font_selector.right
    anchors.top: secondary_color_color_selector.bottom

    name: "Secondary Font"

    data_ref: root.data_ref_secondary_font

    visible: custom_style_switch.checked && custom_style_switch.visible
  }


}

