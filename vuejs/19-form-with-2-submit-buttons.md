# How implement a multi submit buttons
## Form
````
<b-form
    novalidate=novalidate
>
````
## Field/button
````
<b-button type="submit"
        v-on:click="checkForm('save', $event)"
        size="sm"
        variant="primary"
        style="margin-right: 10px">
<i class="fa fa-dot-circle-o"></i>
Save
</b-button>
````
## checkForm
````
      checkForm: function (keyWord, e) {
        ...

        if (!this.errors.length && !this.error.length) {
          if (keyWord === 'save') {
            this.create();
            return true;
          }
        }

        if (!this.errors.length && !this.error.length) {
          if (keyWord === 'saveAndNew') {
            this.saveAndNew();
            return true;
          }
        }

        e.preventDefault();
      }
````
## create()
````
create() {
    let dataPost = {
      name: this.name,
      organization_id: this.organizationId,
      parent_id: this.parentId === '' ? null : this.parentId
    };
    addLeadStatus(dataPost)
      .then(() => this.leadStatusCreatingSuccessful())
      .catch((request) => this.leadStatusCreatingFailed(request));
}
````


