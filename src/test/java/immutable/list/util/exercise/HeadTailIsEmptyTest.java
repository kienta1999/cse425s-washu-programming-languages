/*******************************************************************************
 * Copyright (C) 2016-2019 Dennis Cosgrove
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 ******************************************************************************/
package immutable.list.util.exercise;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import immutable.list.util.core.ImList;

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
public class HeadTailIsEmptyTest {
	@Test
	public void test() {
		ImList<String> empty = ImLists.nil();
		assertTrue(empty.isEmpty());
		
		ImList<String> c = ImLists.cons("beauty", empty);
		assertFalse(c.isEmpty());
		assertEquals("beauty", c.head());
		assertNotNull(c.tail());
		assertTrue(c.tail().isEmpty());
		
		ImList<String> bc = ImLists.cons("is", c);
		assertFalse(bc.isEmpty());
		assertEquals("is", bc.head());
		assertNotNull(bc.tail());
		assertFalse(bc.tail().isEmpty());
		assertEquals("beauty", bc.tail().head());
		assertNotNull(bc.tail().tail());
		assertTrue(bc.tail().tail().isEmpty());
		
		ImList<String> abc = ImLists.cons("truth", bc);
		assertFalse(abc.isEmpty());
		assertEquals("truth", abc.head());
		assertNotNull(abc.tail());
		assertFalse(abc.tail().isEmpty());
		assertEquals("is", abc.tail().head());
		assertNotNull(abc.tail().tail());
		assertFalse(abc.tail().tail().isEmpty());
		assertEquals("beauty", abc.tail().tail().head());
		assertNotNull(abc.tail().tail().tail());
		assertTrue(abc.tail().tail().tail().isEmpty());
	}
}
