/*
 * Copyright (C) 2011 - 2013 by Eero Laukkanen, Risto Virtanen, Jussi Patana,
 * Juha Viljanen, Joona Koistinen, Pekka Rihtniemi, Mika Kekäle, Roope Hovi,
 * Mikko Valjus, Timo Lehtinen, Jaakko Harjuhahto, Jonne Viitanen, Jari Jaanto,
 * Toni Sevenius, Anssi Matti Helin, Jerome Saarinen, Markus Kere
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
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package models.events;

public class AddClassificationEvent extends Event {
	/**
	 * the id of the classification
	 */
	public Long id;

	/**
	 * the name of the classification
	 */
	public String name;

	/**
	 * the type (dimension) of the classification
	 */
	public int dimension;

	/**
	 * the abbreviation of the classification
	 */
	public String abbreviation;

	/**
	 * the explanation of the classification
	 */
	public String explanation;

	/**
	 * Basic constructor
	 */
	public AddClassificationEvent(Long id, String name, int dimension, String abbreviation, String explanation) {
		super("addclassificationevent");
		this.id = id;
		this.name = name;
		this.dimension = dimension;
		this.abbreviation = abbreviation;
		this.explanation = explanation;
	}
}