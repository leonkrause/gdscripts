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

	#============================================================#
	# WARNING: This is unintended and will be removed eventually #
	#============================================================#
	
	# create Dictionary per literal => shared mode
	var literal_dict = {}
	# create Dictionary per constructor => copy-on-write ('COW') mode
	var ctor_dict = Dictionary()
	
	# assign shared dict to var => reference
	var literal_dict_copy = literal_dict
	# assign COW dict to var => reference until written to
	var ctor_dict_copy = ctor_dict
	
	# Add key-value pair to references
	literal_dict_copy.test = false
	ctor_dict_copy.test = false
	
	# key added to the original dictionary
	prints( "literal_dict.size():", literal_dict.size() ) # == 1
	# literal_dict_copy still references literal_dict
	prints( "literal_dict_copy.size():", literal_dict_copy.size() ) # == 1
	
	# original remains unchanged
	prints( "ctor_dict.size():", ctor_dict.size() ) # == 0
	# key added to copy of the original dictionary,
	# ctor_dict_copy no longer references ctor_dict
	prints( "ctor_dict_copy.size():", ctor_dict_copy.size() ) # == 1
	
	
	# Same goes for arrays:
	
	var literal_array = []
	var ctor_array = Array()
	
	var literal_array_copy = literal_array
	var ctor_array_copy = ctor_array
	
	literal_array_copy.push_back( "test" )
	ctor_array_copy.push_back( "test" )
	
	prints( "literal_array.is_shared():", literal_array.is_shared() ) # == True
	prints( "literal_array.size():", literal_array.size() ) # == 1
	# still a reference to literal_array_copy after push_back
	prints( "literal_array_copy.size():", literal_array_copy.size() ) # == 1
	
	prints( "ctor_array.is_shared():", ctor_array.is_shared() ) # == False
	prints( "ctor_array.size():", ctor_array.size() ) # == 0
	# no longer a reference to ctor_array after push_back
	prints( "ctor_array_copy.size():", ctor_array_copy.size() ) # == 1
