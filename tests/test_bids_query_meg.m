function test_suite = test_bids_query_meg %#ok<*STOUT>
  try % assignment of 'localfunctions' is necessary in Matlab >= 2016
    test_functions = localfunctions(); %#ok<*NASGU>
  catch % no problem; early Matlab versions can use initTestSuite fine
  end
  initTestSuite;
end

function test_bids_query_meg_basic()
  %
  %   meg queries
  %

  pth_bids_example = get_test_data_dir();

  BIDS = bids.layout(fullfile(pth_bids_example, 'ds000246'));

  modalities = {'anat', 'meg'};
  assertEqual(bids.query(BIDS, 'modalities'), modalities);

  types = {'T1w', 'channels', 'photo'};
  % missing:  'meg' 'coordsystem', 'headshape'
  assertEqual(bids.query(BIDS, 'types'), types);

  BIDS = bids.layout(fullfile(pth_bids_example, 'ds000247'));
  BIDS = bids.layout(fullfile(pth_bids_example, 'ds000248'));

end
