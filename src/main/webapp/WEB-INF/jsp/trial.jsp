<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>

<html>
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">



<p id="text-to-copy">This is the text that will be copied.</p>
<button onclick="copyText()"><span class="material-icons">content_copy</span> Copy text</button>

<!-- JavaScript code -->
<script>
function copyText() {
  const textToCopy = document.getElementById("text-to-copy");
  const textRange = document.createRange();
  textRange.selectNode(textToCopy);
  window.getSelection().removeAllRanges();
  window.getSelection().addRange(textRange);
  document.execCommand('copy');
  window.getSelection().removeAllRanges();
  alert("Text copied!");
}
</script>

