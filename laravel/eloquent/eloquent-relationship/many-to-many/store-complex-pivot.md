# Store complex pivot
## Controller
````
if ($workflow->save()) {
    $stages = $request->stages;
    $this->storeWorkflowStages($workflow->id, $stages);

    return response()->json(
        $this->resp(
            200,
            'Workflows.store'
        ),
        200
    );
}

private function storeWorkflowStages($workflowId, $stages)
{
    $arr      = $this->formatStages($stages);
    $workflow = Workflow::find($workflowId);
    $workflow->stages()->attach($arr);

    return true;
}

/**
 * @param $stages
 *
 * @return array
 */
private function formatStages($stages)
{
    $arr = [];
    foreach ($stages as $stage) {
        $arr[$stage['id']] = ['order' => $stage['order']];
    }

    return $arr;
}
````
