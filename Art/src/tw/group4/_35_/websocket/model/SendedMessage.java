package tw.group4._35_.websocket.model;

//接收client端訊息
public class SendedMessage {
	
	private String from;
    private String text;
    
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}

}
