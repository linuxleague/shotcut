/*
 * Copyright (c) 2014-2018 Meltytech, LLC
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import Shotcut.Controls 1.0

Item {
    property string fillProperty
    property string distortProperty
    property string legacyRectProperty: null
    property string rectProperty
    property string valignProperty
    property string halignProperty
    property rect filterRect
    property string startValue: '_shotcut:startValue'
    property string middleValue: '_shotcut:middleValue'
    property string endValue:  '_shotcut:endValue'

    width: 350
    height: 180

    Component.onCompleted: {
        filter.blockSignals = true
        filter.set(middleValue, Qt.rect(0, 0, profile.width, profile.height))
        filter.set(startValue, Qt.rect(0, 0, profile.width, profile.height))
        filter.set(endValue, Qt.rect(0, 0, profile.width, profile.height))
        if (filter.isNew) {
            filter.set(fillProperty, 0)
            filter.set(distortProperty, 0)

            filter.set(rectProperty,   '0%/50%:50%x50%')
            filter.set(valignProperty, 'bottom')
            filter.set(halignProperty, 'left')
            filter.savePreset(preset.parameters, qsTr('Bottom Left'))

            filter.set(rectProperty,   '50%/50%:50%x50%')
            filter.set(valignProperty, 'bottom')
            filter.set(halignProperty, 'right')
            filter.savePreset(preset.parameters, qsTr('Bottom Right'))

            filter.set(rectProperty,   '0%/0%:50%x50%')
            filter.set(valignProperty, 'top')
            filter.set(halignProperty, 'left')
            filter.savePreset(preset.parameters, qsTr('Top Left'))

            filter.set(rectProperty,   '50%/0%:50%x50%')
            filter.set(valignProperty, 'top')
            filter.set(halignProperty, 'right')
            filter.savePreset(preset.parameters, qsTr('Top Right'))

            // Add some animated presets.
            filter.set(valignProperty, 'middle')
            filter.set(halignProperty, 'center')
            filter.animateIn = Math.round(profile.fps)
            filter.set(rectProperty,   '0=-100%/0%:100%x100%; :1.0=0%/0%:100%x100%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slide In From Left'))
            filter.set(rectProperty,   '0=100%/0%:100%x100%; :1.0=0%/0%:100%x100%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slide In From Right'))
            filter.set(rectProperty,   '0=0%/-100%:100%x100%; :1.0=0%/0%:100%x100%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slide In From Top'))
            filter.set(rectProperty,   '0=0%/100%:100%x100%; :1.0=0%/0%:100%x100%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slide In From Bottom'))
            filter.animateIn = 0
            filter.animateOut = Math.round(profile.fps)
            filter.set(rectProperty,   ':-1.0=0%/0%:100%x100%; -1=-100%/0%:100%x100%')
            filter.savePreset(preset.parameters.concat('shotcut:animOut'), qsTr('Slide Out Left'))
            filter.set(rectProperty,   ':-1.0=0%/0%:100%x100%; -1=100%/0%:100%x100%')
            filter.savePreset(preset.parameters.concat('shotcut:animOut'), qsTr('Slide Out Right'))
            filter.set(rectProperty,   ':-1.0=0%/0%:100%x100%; -1=0%/-100%:100%x100%')
            filter.savePreset(preset.parameters.concat('shotcut:animOut'), qsTr('Slide Out Top'))
            filter.set(rectProperty,   ':-1.0=0%/0%:100%x100%; -1=0%/100%:100%x100%')
            filter.savePreset(preset.parameters.concat('shotcut:animOut'), qsTr('Slide Out Bottom'))
            filter.set(fillProperty, 1)
            filter.animateOut = 0
            filter.animateIn = filter.duration
            filter.set(rectProperty,   '0=0%/0%:100%x100%; -1=-5%/-5%:110%x110%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slow Zoom In'))
            filter.set(rectProperty,   '0=-5%/-5%:110%x110%; -1=0%/0%:100%x100%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slow Zoom Out'))
            filter.set(rectProperty,   '0=-5%/-5%:110%x110%; -1=-10%/-5%:110%x110%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slow Pan Left'))
            filter.set(rectProperty,   '0=-5%/-5%:110%x110%; -1=0%/-5%:110%x110%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slow Pan Right'))
            filter.set(rectProperty,   '0=-5%/-5%:110%x110%; -1=-5%/-10%:110%x110%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slow Pan Up'))
            filter.set(rectProperty,   '0=-5%/-5%:110%x110%; -1=-5%/0%:110%x110%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slow Pan Down'))
            filter.set(rectProperty,   '0=0%/0%:100%x100%; -1=-10%/-10%:110%x110%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slow Zoom In, Pan Up Left'))
            filter.set(rectProperty,   '0=0%/0%:100%x100%; -1=0%/0%:110%x110%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slow Zoom In, Pan Down Right'))
            filter.set(rectProperty,   '0=-10%/0%:110%x110%; -1=0%/0%:100%x100%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slow Zoom Out, Pan Up Right'))
            filter.set(rectProperty,   '0=0%/-10%:110%x110%; -1=0%/0%:100%x100%')
            filter.savePreset(preset.parameters.concat('shotcut:animIn'), qsTr('Slow Zoom Out, Pan Down Left'))
            filter.animateIn = 0
            filter.resetProperty(rectProperty)

            // Add default preset.
            filter.set(rectProperty,   '0%/0%:100%x100%')
            filter.set(valignProperty, 'top')
            filter.set(halignProperty, 'left')
            filter.savePreset(preset.parameters)
        } else {
            if (legacyRectProperty !== null) {
                var old = filter.get(legacyRectProperty)
                if (old && old.length > 0) {
                    filter.resetProperty(legacyRectProperty)
                    filter.set(rectProperty, old)
                }
            }
            filterRect = filter.getRect(rectProperty)
            filter.set(middleValue, filter.getRect(rectProperty, filter.animateIn + 1))
            if (filter.animateIn > 0)
                filter.set(startValue, filter.getRect(rectProperty, 0))
            if (filter.animateOut > 0)
                filter.set(endValue, filter.getRect(rectProperty, filter.duration - 1))
        }
        filter.blockSignals = false
        setControls()
        setKeyframedControls()
        if (filter.isNew)
            filter.set(rectProperty, filter.getRect(rectProperty))
        else
            filter.changed()
    }

    function getPosition() {
        return Math.max(producer.position - (filter.in - producer.in), 0)
    }

    function setFilter(position) {
        if (position !== null) {
            if (position <= 0 && filter.animateIn > 0)
                filter.set(startValue, filterRect)
            else if (position >= filter.duration - 1 && filter.animateOut > 0)
                filter.set(endValue, filterRect)
            else
                filter.set(middleValue, filterRect)
        }

        if (filter.animateIn > 0 || filter.animateOut > 0) {
            filter.resetProperty(rectProperty)
            positionKeyframesButton.checked = false
            if (filter.animateIn > 0) {
                filter.set(rectProperty, filter.getRect(startValue), 1.0, 0)
                filter.set(rectProperty, filter.getRect(middleValue), 1.0, filter.animateIn - 1)
            }
            if (filter.animateOut > 0) {
                filter.set(rectProperty, filter.getRect(middleValue), 1.0, filter.duration - filter.animateOut)
                filter.set(rectProperty, filter.getRect(endValue), 1.0, filter.duration - 1)
            }
        } else if (!positionKeyframesButton.checked) {
            filter.resetProperty(rectProperty)
            filter.set(rectProperty, filter.getRect(middleValue))
        } else if (position !== null) {
            filter.set(rectProperty, filterRect, 1.0, position)
        }
    }

    function setControls() {
        if (filter.get(distortProperty) === '1')
            distortRadioButton.checked = true
        else if (filter.get(fillProperty) === '1')
            fillRadioButton.checked = true
        else
            fitRadioButton.checked = true
        var align = filter.get(halignProperty)
        if (align === 'left')
            leftRadioButton.checked = true
        else if (align === 'center' || align === 'middle')
            centerRadioButton.checked = true
        else if (filter.get(halignProperty) === 'right')
            rightRadioButton.checked = true
        align = filter.get(valignProperty)
        if (align === 'top')
            topRadioButton.checked = true
        else if (align === 'center' || align === 'middle')
            middleRadioButton.checked = true
        else if (align === 'bottom')
            bottomRadioButton.checked = true
    }

    function setKeyframedControls() {
        var position = getPosition()
        var newValue = filter.getRect(rectProperty, position)
        if (filterRect !== newValue) {
            filterRect = newValue
            rectX.text = filterRect.x.toFixed()
            rectY.text = filterRect.y.toFixed()
            rectW.text = filterRect.width.toFixed()
            rectH.text = filterRect.height.toFixed()
        }
        var enabled = position <= 0 || (position >= (filter.animateIn - 1) && position <= (filter.duration - filter.animateOut)) || position >= (filter.duration - 1)
        rectX.enabled = enabled
        rectY.enabled = enabled
        rectW.enabled = enabled
        rectH.enabled = enabled
    }

    ExclusiveGroup { id: sizeGroup }
    ExclusiveGroup { id: halignGroup }
    ExclusiveGroup { id: valignGroup }

    GridLayout {
        columns: 6
        anchors.fill: parent
        anchors.margins: 8

        Label {
            text: qsTr('Preset')
            Layout.alignment: Qt.AlignRight
        }
        Preset {
            id: preset
            parameters: [fillProperty, distortProperty, rectProperty, halignProperty, valignProperty]
            Layout.columnSpan: 5
            onBeforePresetLoaded: {
                filter.resetProperty(rectProperty)
            }
            onPresetSelected: {
                setControls()
                filterRect = filter.getRect(rectProperty, getPosition())
                filter.set(middleValue, filter.getRect(rectProperty, filter.animateIn + 1))
                if (filter.animateIn > 0)
                    filter.set(startValue, filter.getRect(rectProperty, 0))
                if (filter.animateOut > 0)
                    filter.set(endValue, filter.getRect(rectProperty, filter.duration - 1))
            }
        }

        Label {
            text: qsTr('Position')
            Layout.alignment: Qt.AlignRight
        }
        RowLayout {
            Layout.columnSpan: 3
            TextField {
                id: rectX
                horizontalAlignment: Qt.AlignRight
                onEditingFinished: {
                    filterRect.x = parseFloat(text)
                    setFilter(getPosition())
                }
            }
            Label { text: ',' }
            TextField {
                id: rectY
                horizontalAlignment: Qt.AlignRight
                onEditingFinished: {
                    filterRect.y = parseFloat(text)
                    setFilter(getPosition())
                }
            }
        }
        UndoButton {
            onClicked: {
                filterRect.x = filterRect.y = 0
                setFilter(getPosition())
            }
        }
        KeyframesButton {
            id: positionKeyframesButton
            checked: filter.keyframeCount(rectProperty) > 0 && filter.animateIn <= 0 && filter.animateOut <= 0
            onToggled: {
                if (checked) {
                    filter.clearSimpleAnimation(rectProperty)
                    filter.set(rectProperty, filterRect, 1.0, getPosition())
                } else {
                    filter.resetProperty(rectProperty)
                    filter.set(rectProperty, filterRect)
                }
            }
        }

        Label {
            text: qsTr('Size')
            Layout.alignment: Qt.AlignRight
        }
        RowLayout {
            Layout.columnSpan: 3
            TextField {
                id: rectW
                horizontalAlignment: Qt.AlignRight
                onEditingFinished: {
                    filterRect.width = parseFloat(text)
                    setFilter(getPosition())
                }
            }
            Label { text: 'x' }
            TextField {
                id: rectH
                horizontalAlignment: Qt.AlignRight
                onEditingFinished: {
                    filterRect.height = parseFloat(text)
                    setFilter(getPosition())
                }
            }
        }
        UndoButton {
            onClicked: {
                filterRect.width = profile.width
                filterRect.height = profile.height
                setFilter(getPosition())
            }
        }
        Item { Layout.fillWidth: true }

        Label {
            text: qsTr('Size mode')
            Layout.alignment: Qt.AlignRight
        }
        RadioButton {
            id: fitRadioButton
            text: qsTr('Fit')
            exclusiveGroup: sizeGroup
            onClicked: {
                filter.set(fillProperty, 0)
                filter.set(distortProperty, 0)
            }
        }
        RadioButton {
            id: fillRadioButton
            text: qsTr('Fill')
            exclusiveGroup: sizeGroup
            onClicked: {
                filter.set(fillProperty, 1)
                filter.set(distortProperty, 0)
            }
        }
        RadioButton {
            id: distortRadioButton
            text: qsTr('Distort')
            exclusiveGroup: sizeGroup
            onClicked: {
                filter.set(fillProperty, 1)
                filter.set(distortProperty, 1)
            }
        }
        UndoButton {
            onClicked: {
                fillRadioButton.checked = true
                filter.set(fillProperty, 1)
                filter.set(distortProperty, 0)
            }
        }
        Item { Layout.fillWidth: true }

        Label {
            text: qsTr('Horizontal fit')
            Layout.alignment: Qt.AlignRight
        }
        RadioButton {
            id: leftRadioButton
            text: qsTr('Left')
            exclusiveGroup: halignGroup
            enabled: fitRadioButton.checked
            onClicked: filter.set(halignProperty, 'left')
        }
        RadioButton {
            id: centerRadioButton
            text: qsTr('Center')
            exclusiveGroup: halignGroup
            enabled: fitRadioButton.checked
            onClicked: filter.set(halignProperty, 'center')
        }
        RadioButton {
            id: rightRadioButton
            text: qsTr('Right')
            exclusiveGroup: halignGroup
            enabled: fitRadioButton.checked
            onClicked: filter.set(halignProperty, 'right')
        }
        UndoButton {
            onClicked: {
                leftRadioButton.checked = true
                filter.set(halignProperty, 'left')
            }
        }
        Item { Layout.fillWidth: true }

        Label {
            text: qsTr('Vertical fit')
            Layout.alignment: Qt.AlignRight
        }
        RadioButton {
            id: topRadioButton
            text: qsTr('Top')
            exclusiveGroup: valignGroup
            enabled: fitRadioButton.checked
            onClicked: filter.set(valignProperty, 'top')
        }
        RadioButton {
            id: middleRadioButton
            text: qsTr('Middle', 'Size and Position video filter')
            exclusiveGroup: valignGroup
            enabled: fitRadioButton.checked
            onClicked: filter.set(valignProperty, 'middle')
        }
        RadioButton {
            id: bottomRadioButton
            text: qsTr('Bottom')
            exclusiveGroup: valignGroup
            enabled: fitRadioButton.checked
            onClicked: filter.set(valignProperty, 'bottom')
        }
        UndoButton {
            onClicked: {
                topRadioButton.checked = true
                filter.set(valignProperty, 'top')
            }
        }
        Item { Layout.fillWidth: true }

        Item { Layout.fillHeight: true }
    }

    Connections {
        target: filter
        onChanged: setKeyframedControls()
        onInChanged: setFilter(null)
        onOutChanged: setFilter(null)
        onAnimateInChanged: setFilter(null)
        onAnimateOutChanged: setFilter(null)
    }

    Connections {
        target: producer
        onPositionChanged: setKeyframedControls()
    }
}
