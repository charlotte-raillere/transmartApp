<!--
  tranSMART - translational medicine data mart
  
  Copyright 2008-2012 Janssen Research & Development, LLC.
  
  This product includes software developed at Janssen Research & Development, LLC.
  
  This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License 
  as published by the Free Software  * Foundation, either version 3 of the License, or (at your option) any later version, along with the following terms:
  1.	You may convey a work based on this program in accordance with section 5, provided that you retain the above notices.
  2.	You may convey verbatim copies of this program code as you receive it, in any medium, provided that you retain the above notices.
  
  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS    * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
  
  You should have received a copy of the GNU General Public License along with this program.  If not, see http://www.gnu.org/licenses/.
  
 
-->

<g:if test="${!layout}">
	<i>No columns have been set up for the analysis view</i>
</g:if>
<table class="columndetail" style="width: 515px;">
	<tbody>
		<g:each in="${layout}" var="layoutRow">
			<%-- Special cases: only display cutoffs if this is a comparison --%>
			<g:if test="${(!layoutRow.column.equals('pValueCutoff') && !layoutRow.column.equals('foldChangeCutoff')) || 'comparison'.equals(analysis.analysisMethodCode)}">
				<tr class="columnprop">
				
					<g:if test="${analysis.assayDataType.equals('EQTL') && layoutRow.column.equals('phenotypes')}">
						<td valign="top" class="columnname">Diseases</td>
					</g:if>
					<g:else>
						<td valign="top" class="columnname">${layoutRow.displayName}</td>
					</g:else>
					
					<td valign="top" class="columnvalue">
						<%-- Special cases --%>
						<g:if test="${layoutRow.column.equals('study')}">
							${study?.title}
						</g:if>
						<g:elseif test="${layoutRow.column.equals('phenotypes')}">
							<ul>
								<g:each in="${analysis.diseases}" var="disease">
									<li>${disease.disease}</li>
								</g:each>
								<%-- If this is not EQTL, put observations here as well --%>
								<g:if test="${!analysis.assayDataType.equals('EQTL')}">
									<g:each in="${analysis.observations}" var="obs">
										<li>${obs.name}</li>
									</g:each>
								</g:if>
							</ul>
						</g:elseif>
						<g:elseif test="${layoutRow.column.equals('platforms')}">
							<ul>
								<g:each in="${analysis.platforms}" var="platform">
									<li>${platform.vendor}: ${platform.name}</li>
								</g:each>
							</ul>
						</g:elseif>
						
						<g:elseif test="${layoutRow.dataType == 'date'}">
							<g:fieldDate bean="${analysis}" field="${layoutRow.column}" format="yyyy-MM-dd"/>
						</g:elseif>
						
						<g:else> <%-- In all other cases, display as string --%>
							${fieldValue(bean:analysis,field:layoutRow.column)}
						</g:else>
					</td>
			</tr>
		</g:if>
		</g:each>
	</tbody>
</table>
