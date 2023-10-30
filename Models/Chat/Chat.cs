﻿
namespace ESFE.Chatbot.Models.Chat;
public class Chat
{
    public List<ChatMetadata>? meta { get; set; }
    public string? question { get; set; }
    public string? text { get; set; }
}

public class ChatMetadata
{
    public string? document_title { get; set; }
    public string? file_name { get; set; }
}