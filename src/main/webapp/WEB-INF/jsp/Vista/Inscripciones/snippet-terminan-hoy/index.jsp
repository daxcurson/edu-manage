<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
<%@include file="/WEB-INF/jsp/Vista/Inscripciones/snippet-terminan-hoy/vue-terminan-hoy.js" %> 
</script>

<!-- component template -->
<script type="text/x-template" id="alumnos-template">
  <table class="table">
    <thead>
      <tr>
        <th v-for="key in columns"
          @click="sortBy(key)"
          :class="{ active: sortKey == key }">
          {{ key | capitalize }}
          <span class="arrow" :class="sortOrders[key] > 0 ? 'asc' : 'dsc'">
          </span>
        </th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="entry in filteredData">
        <td v-for="key in columns">
          {{entry[key]}}
        </td>
      </tr>
    </tbody>
  </table>
</script>

<div id="alumnos">
	<form id="search">
		Buscar <input name="query" v-model="searchQuery">
	</form>
	<alumnos-grid :data="alumnosData" :columns="alumnosColumns"
		:filter-key="searchQuery"> </alumnos-grid>
</div>