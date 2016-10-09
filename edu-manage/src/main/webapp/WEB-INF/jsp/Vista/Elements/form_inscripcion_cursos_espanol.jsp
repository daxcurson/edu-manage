<div id="PaquetesEspanol">
<p>Would you like to sign up for any of our extras? You get 15% off your 1st Spanish course if you book accommodation through us!</p>
<div id="ListaPaquetes">
</div>
</div>
<form:label path="persona.accomodation_services" id="LabelPersonaAccomodationServices"><spring:message code="label.persona_accomodation_services"/></form:label>
<form:select path="persona.accomodation_services" id="PersonaAccomodationServices">
<form:option value="Si" label="Yes"/>
<form:option value="No" label="No"/>
</form:select>
<form:label path="persona.picked_up_airport" id="LabelPersonaPickedUpAirport"><spring:message code="label.persona_picked_up_airport"/></form:label>
<form:select path="persona.picked_up_airport" id="PersonaPickedUpAirport">
<form:option value="Si" label="Yes"/>
<form:option value="No" label="No"/>
</form:select>
<form:label path="persona.dropped_off_airport" id="LabelPersonaDroppedOffAirport"><spring:message code="label.persona_dropped_off_airport"/></form:label>
<form:select path="persona.dropped_off_airport" id="PersonaDroppedOffAirport">
<form:option value="Si" label="Yes"/>
<form:option value="No" label="No"/>
</form:select>