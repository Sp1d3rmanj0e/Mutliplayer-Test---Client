/// @description Insert description here
// You can write your code in this editor

client_socket = network_create_socket(network_socket_tcp);
network_connect(client_socket, "192.168.1.101", 8080);

// Data to send
var _string = "hi server";

// Create buffer
var _stringSize = string_byte_length(_string);
var _buffer = buffer_create(_stringSize+1, buffer_fixed, 1);

// Add data
buffer_seek(_buffer, buffer_seek_start, 0);
buffer_write(_buffer, buffer_string, _string);

// Send data
network_send_packet(client_socket, _buffer, buffer_get_size(_buffer));

// Remove buffer
buffer_delete(_buffer);