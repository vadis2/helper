# Visibility management
````
<a @click="newFile" class="btn btn-warning btn-block" style="margin-bottom: 20px;">Create New File</a>
````
````
<div id="newFile" :style="{ 'display': display}">
  Form
  <hr>
</div>           
````
````
data() {
  return {
    ...
    display: "none;"
  }
},
````
````
methods: {
  newFile() {
    this.display = 'block';
},
````
````
<style scoped lang="scss">
#newFile {
  display: none;
}
````
