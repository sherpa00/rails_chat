document.addEventListener("turbo:load", function () {
  const messageContainer = document.getElementById("messages");
  messageContainer.scrollTop = messageContainer.scrollHeight;
});

document.addEventListener("turbo:stream:append", function (event) {
  const messageContainer = document.getElementById("messages");
  messageContainer.scrollTop = messageContainer.scrollHeight;
});
