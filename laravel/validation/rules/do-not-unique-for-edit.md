public function rules()
    {
        return [
            'first_name' => 'required|max:255',
            'last_name'  => 'required|max:255',
            'email'      => [
                'required',
                Rule::unique('users')->ignore($_POST['id']),
                'max:255',
                ],
        ];
    }