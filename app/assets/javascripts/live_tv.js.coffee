$(document).ready -> centerChannelInfo();

centerChannelInfo = ->
  docWidth = $("body").width();
  divWidth = $("#current_channel_info").width();
  left = (docWidth - divWidth) / 2;
  $("#current_channel_info").attr("style", "left: "+left+"px");

  docHeight = $("body").height()
  maxHeight = docHeight - 10
  divHeight = $("#channellist").prop("scrollHeight")
  divHeight = maxHeight if divHeight > maxHeight
  top = (docHeight - divHeight) / 2


  $("#channellist").attr("style", "top: "+top+"px; max-height: "+maxHeight+"px; height: "+divHeight+"px;");

  alert $("#channellist").maxWidth();
