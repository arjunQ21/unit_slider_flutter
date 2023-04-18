# unit_slider

iPhone Style horizontal slider in Flutter

## How it Looks

![Slider Demo](https://raw.githubusercontent.com/arjunQ21/unit_slider_flutter/main/assets/unit_slider.gif)

## Usage


    UnitSlider(
        // min value in slider
        minValue: 1,
        // max value in slider
        maxValue: 5,
        // current value 
        value: 3,
        // this many lines will be shown in UI
        steps: 30,
        // width of a line. default value is 10
        stepWidth: 10,
        // this runs when value in slider is changed
        onChanged: (value) {
        setState(() {
            _currentValue = value;
        });
        },
    ),
        

Make my day by starring ⭐️ this repo.



