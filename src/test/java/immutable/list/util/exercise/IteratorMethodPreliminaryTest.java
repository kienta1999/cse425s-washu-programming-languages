/*******************************************************************************
 * Copyright (C) 2016-2020 Dennis Cosgrove
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
import static org.junit.Assert.assertTrue;

import java.util.Iterator;

import org.junit.Test;

import immutable.list.util.core.ImList;

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
public class IteratorMethodPreliminaryTest {
	@Test
	public void test() {
		ImList<String> empty = ImLists.nil();
		Iterator<String> emptyIterator = empty.iterator();
		assertFalse(emptyIterator.hasNext());

		ImList<String> c = ImLists.cons("beauty", empty);
		Iterator<String> cIterator = c.iterator();
		assertTrue(cIterator.hasNext());
		assertEquals("beauty", cIterator.next());
		assertFalse(cIterator.hasNext());

		ImList<String> bc = ImLists.cons("is", c);
		Iterator<String> bcIterator = bc.iterator();
		assertTrue(bcIterator.hasNext());
		assertEquals("is", bcIterator.next());
		assertTrue(bcIterator.hasNext());
		assertEquals("beauty", bcIterator.next());
		assertFalse(bcIterator.hasNext());

		ImList<String> abc = ImLists.cons("truth", bc);
		Iterator<String> abcIterator = abc.iterator();
		assertTrue(abcIterator.hasNext());
		assertEquals("truth", abcIterator.next());
		assertTrue(abcIterator.hasNext());
		assertEquals("is", abcIterator.next());
		assertTrue(abcIterator.hasNext());
		assertEquals("beauty", abcIterator.next());
		assertFalse(abcIterator.hasNext());
	}
}
