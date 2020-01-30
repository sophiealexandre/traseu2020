var typeString = ['style', 'budget', 'schedule'];
var  i = 0;
var count = 0
var selectedText = '';
var text = '';

const dynamicText = () => {
  (function type() {
    if (count == typeString.length) {
      count = 0;
    }
    selectedText = typeString[count];
    text = selectedText.slice(0, ++i);
    document.getElementById('typing').innerHTML = text;
    if (text.length === selectedText.length) {
      count++;
      i = 0;
      setTimeout(type, 1000);
    } else {
      setTimeout(type, 300);
    }

  }());
}

export { dynamicText };
