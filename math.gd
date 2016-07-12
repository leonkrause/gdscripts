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
	printerr( "Instantiating library `Math`" )
	assert( !self )

const EPSILON = 0.00001

static func is_real_zero( number ):
	return abs( number ) < EPSILON

static func is_real_equal( number, other ):
	return abs( number - other ) < EPSILON

static func is_diagonal_vector( vector ):
	return not is_real_zero( vector.x ) and not is_real_zero( vector.y )

static func is_zero_vector( vector ):
	return is_real_zero( vector.x ) and is_real_zero( vector.y )

static func is_unit_vector( vector ):
	return is_real_equal( vector.length_squared(), 1 )

static func is_arithmetic( variant ):
	return typeof(variant) == TYPE_REAL or typeof(variant) == TYPE_INT

static func array_sum( array ):
	var sum = 0
	for element in array:
		sum += element
	return sum

static func array_product( array ):
	var product = 1.0
	for element in array:
		product *= element
	return product

static func dict_key_sum( dict ):
	var sum = 0
	for key in dict:
		sum += key
	return sum

static func dict_key_product( dict ):
	var product = 1
	for key in dict:
		product *= key
	return product

static func dict_value_sum( dict ):
	var sum = 0
	for key in dict:
		sum += dict[key]
	return sum

static func dict_value_product( dict ):
	var product = 1
	for key in dict:
		product *= dict[key]
	return product
