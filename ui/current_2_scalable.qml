// Copyright 2021, Mycroft AI Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/*
One of many screns that show when the user asks for the current weather.

Shows the high/low temperature for today.

This code written to be scalable for different screen sizes.  It can be used on any
device not conforming to the Mark II screen's form factor.
*/
import QtQuick.Layouts 1.4
import QtQuick 2.4
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

import Mycroft 1.0 as Mycroft
import org.kde.lottie 1.0

WeatherDelegateScalable {
    id: rootPageTwo

    Rectangle {
        width: parent.width
        height: parent.height
        color: "black"

        WeatherLocation {
            id: weatherLocationPageTwo
            fontSize: parent.height > parent.width ? parent.width * 0.10 : 45
        }

        GridLayout {
            id: weatherPageTwo
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: weatherLocationPageTwo.bottom
            anchors.topMargin: Mycroft.Units.gridUnit * 2
            columns: 2
            columnSpacing: Mycroft.Units.gridUnit * 2

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Item {
                    id: windIconArea
                    anchors.top: parent.top
                    width: parent.width
                    height: parent.height / 2

                    Image {
                        id: windIcon
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: Mycroft.Units.gridUnit
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width - Mycroft.Units.gridUnit * 2
                        height: parent.height > parent.width ? width : parent.height - Mycroft.Units.gridUnit * 2
                        fillMode: Image.PreserveAspectFit
                        source: Qt.resolvedUrl("images/wind.svg")
                    }
                }
                Label {
                    id: windSpeed
                    anchors.top: windIconArea.bottom
                    width: parent.width
                    height: parent.height / 2
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: parent.height > parent.width ? parent.width * 0.65 : parent.height * 0.65
                    font.family: "Noto Sans"
                    font.styleName: "Bold"
                    text: sessionData.windSpeed
                }
            }
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Item {
                    id: humidityIconArea
                    anchors.top: parent.top
                    width: parent.width
                    height: parent.height / 2

                    Image {
                        id: humidityIcon
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: Mycroft.Units.gridUnit
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width - Mycroft.Units.gridUnit * 2
                        height: parent.height > parent.width ? width : parent.height - Mycroft.Units.gridUnit * 2
                        fillMode: Image.PreserveAspectFit
                        source: Qt.resolvedUrl("images/humidity.svg")
                    }
                }

                Label {
                    id: humidityPercentage
                    anchors.top: humidityIconArea.bottom
                    width: parent.width
                    height: parent.height / 2
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: parent.height > parent.width ? parent.width * 0.65 : parent.height * 0.65
                    font.family: "Noto Sans"
                    font.styleName: "Bold"
                    text: sessionData.humidity
                }
            }
        }
    }
}
