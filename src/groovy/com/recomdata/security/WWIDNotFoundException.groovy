/*************************************************************************
 * tranSMART - translational medicine data mart
 * 
 * Copyright 2008-2012 Janssen Research & Development, LLC.
 * 
 * This product includes software developed at Janssen Research & Development, LLC.
 * 
 * This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License 
 * as published by the Free Software  * Foundation, either version 3 of the License, or (at your option) any later version, along with the following terms:
 * 1.	You may convey a work based on this program in accordance with section 5, provided that you retain the above notices.
 * 2.	You may convey verbatim copies of this program code as you receive it, in any medium, provided that you retain the above notices.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS    * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * 
 *
 ******************************************************************/
  

/**
* $Id: WWIDNotFoundException.groovy
* @author $Author: Sai Munikuntla
*/
package com.recomdata.security

import org.springframework.security.core.AuthenticationException

/**
* Thrown if an {@link UserDetailsService} implementation cannot locate a {@link User} by its WWID.
*/
class WWIDNotFoundException extends AuthenticationException {
    //~ Constructors =====================O==============================================================================

    /**
     * Constructs a <code>WWIDNotFoundException</code> with the specified
     * message.
     *
     * @param msg the detail message.
     */
    public WWIDNotFoundException(String msg) {
        super(msg);
    }

    /**
     * Constructs a <code>WWIDNotFoundException</code>, making use of the <tt>extraInformation</tt>
     * property of the superclass.
     *
     * @param msg the detail message
     * @param extraInformation additional information such as the WWID.
     */
    public WWIDNotFoundException(String msg, Object extraInformation) {
        super(msg, extraInformation);
    }

    /**
     * Constructs a <code>WWIDNotFoundException</code> with the specified
     * message and root cause.
     *
     * @param msg the detail message.
     * @param t root cause
     */
    public WWIDNotFoundException(String msg, Throwable t) {
        super(msg, t);
    }
}