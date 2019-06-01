// Color pickers in different flavors.
// -----------------------------------

var cpSmall = ColorPicker(document.getElementById('small'), updateInputs);

// Inputs.
// -------

var pickerHex = document.getElementById('picker_hex');
var palette = document.getElementById('palette1');

function updateInputs(hex) {
    pickerHex.value = hex;
    
    palette.style.backgroundColor = hex;
}

function updateColorPickers(hex) {
    cpSmall.setHex(hex);
}

function changePalette(pal) {
    document.getElementById('small').style.visibility = "visible";
    document.getElementById('create_done').style.visibility = "visible";
    palette = document.getElementById(pal);
}

var initialHex = '#ddd';
updateColorPickers(initialHex);
