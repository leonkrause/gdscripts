# Copyright (c) eska <eska@eska.me>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

extends Node

func _init():
	
	randomize()
	if OS.is_debug_build(): AS.set_stream_global_volume_scale( 0.0 )
	
	if not InputMap.has_action('meta_fullscreen'):
		InputMap.add_action('meta_fullscreen')
	if not InputMap.has_action('meta_quit'):
		InputMap.add_action('meta_quit')
	
	var ev = InputEvent()
	ev.type = InputEvent.KEY
	ev.pressed = true
	ev.echo = false
	ev.scancode = KEY_F11
	if not InputMap.action_has_event('meta_fullscreen', ev):
		InputMap.action_add_event('meta_fullscreen', ev)
	ev.scancode = KEY_ESCAPE
	if not InputMap.action_has_event('meta_quit', ev):
		InputMap.action_add_event('meta_quit', ev)
	
	set_process_unhandled_input( true )
	set_pause_mode( PAUSE_MODE_PROCESS )

func _unhandled_input( event ):
	if event.is_action_released( 'meta_quit' ):
		if OS.is_debug_build(): OS.get_main_loop().quit()
	elif event.is_action_released( 'meta_fullscreen' ):
		OS.set_window_fullscreen( !OS.is_window_fullscreen() )
