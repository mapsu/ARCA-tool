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

package models;

import play.db.jpa.JPABase;
import utils.IdComparableModel;

import javax.persistence.*;
import java.util.List;

/**
 * Relation between two causes in an RCA tree.
 * @author Eero Laukkanen
 * TODO Timestamp for update information, updating said timestamp to RCACase
 */
@PersistenceUnit(name = "maindb")
@Entity(name = "relation")
public class Relation extends IdComparableModel {

	/**
	* Relation from cause
	*/
	@ManyToOne
	@JoinColumn(name="causeFrom")
	public Cause causeFrom;

	/**
	* Relation to cause
	*/
	@ManyToOne
	@JoinColumn(name="causeTo")
	public Cause causeTo;

	/**
	 * Creates a relation between two causes.
	 * @param causeFrom cause that is the cause of the relation
	 * @param causeTo cause that is the effect of the relation
	 */
	public Relation(Cause causeFrom, Cause causeTo) {
		this.causeFrom = causeFrom;
		this.causeTo = causeTo;
	}

	public <T extends JPABase> T delete() {
		this.causeFrom.causeRelations.remove(this);
		this.causeTo.causeRelations.remove(this);
		super.delete();
		return (T) this;
	}


	/**
	 * Finds a relation that is between the given two causes, regardless of the relation's direction.
	 *
	 * @param cause1 the first cause
	 * @param cause2 the second cause
	 * @return a Relation or null
	 */
	public static Relation findByCauses(Cause cause1, Cause cause2) {
		List<Relation> relationList = Relation.find(
				"SELECT r FROM relation AS r WHERE (causeFrom=? AND causeTo=?) OR (causeTo=? AND causeFrom=?)",
				cause1, cause2, cause1, cause2
		).fetch();

		if (relationList.size() > 0) {
			return relationList.get(0);
		} else {
			return null;
		}
	}
}
