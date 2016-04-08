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

extends MainLoop

func _iteration( delta ): return true # quit after _initialize()

func _initialize():
	
	# create Dictionary per literal => shared mode
	var literal_dict_original = {}
	# create Dictionary per constructor => copy-on-write ('COW') mode
	var ctor_dict_original = Dictionary()
	
	# assign shared dict to var => reference
	var literal_dict_copy = literal_dict_original
	# assign COW dict to var => reference until written to
	var ctor_dict_copy = ctor_dict_original
	
	# Add key-value pair to references
	literal_dict_copy.test = false
	ctor_dict_copy.test = false
	
	# key added to the original dictionary
	prints( "literal_dict_original.size():", literal_dict_original.size() )
	# literal_dict_copy still references literal_dict_original
	prints( "literal_dict_copy.size():", literal_dict_copy.size() )
	
	# original remains unchanged
	prints( "ctor_dict_original.size():", ctor_dict_original.size() )
	# key added to copy of the original dictionary,
	# ctor_dict_copy no longer references ctor_dict_original
	prints( "ctor_dict_copy.size():", ctor_dict_copy.size() )
	
	
	# same goes for arrays
	var literal_array_original = []
	var ctor_array_original = Array()
	
	var literal_array_copy = literal_array_original
	var ctor_array_copy = ctor_array_original
	
	literal_array_copy.push_back( "test" )
	ctor_array_copy.push_back( "test" )
	
	prints( "literal_array_original.is_shared():", literal_array_original.is_shared() )
	prints( "literal_array_original.size():", literal_array_original.size() )
	prints( "literal_array_copy.size():", literal_array_copy.size() ) # still a reference to literal_array_copy
	
	prints( "ctor_array_original.is_shared():", ctor_array_original.is_shared() )
	prints( "ctor_array_original.size():", ctor_array_original.size() )
	prints( "ctor_array_copy.size():", ctor_array_copy.size() ) # no longer a reference to ctor_array_original after push_back
