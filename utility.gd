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

func _init():
	printerr( "Instantiating library `Util`" )
	assert( !self )

static func ensure_connect( emitter, signal_name, target, function_name, binds=[], flags=0 ):
	if not emitter.is_connected( signal_name, target, function_name ):
		emitter.connect( signal_name, target, function_name, binds, flags )

static func ensure_add_child( parent, child ):
	if not child.is_inside_tree():
		parent.add_child( child )
		return
	assert( child in parent.get_children() )

static func fy_shuffle( ARRAY ):
	var shuffled = []
	shuffled.resize( ARRAY.size() )
	for i in range( ARRAY.size() ):
		var r = randi() % (i+1)
		if r != i: shuffled[i] = shuffled[r]
		shuffled[r] = ARRAY[i]
	return shuffled

static func fy_shuffle_inplace( array ):
	assert( array.is_shared() )
	for i in range(array.size()-2):
		var r = randi() % array.size()
		var t = array[i]
		array[i] = array[r]
		array[r] = t
	return array
