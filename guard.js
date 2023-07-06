
it('should load data correctly', () => {
  const mockData = {
    trf: 'TRF0001',
    type: 'LEGACY/CLIA',
    qc: 'dummy qc',
    partnerName: 'dummy partner',
    site: 'dummy site',
    reportAvailable: '2023-06-01',
    reportAvailableValue: 'dummy value',
    fileName: 'dummy file',
    version: 'v1',
    isRead: true,
    status: 'completed',
    isNew: false,
    updated: '2023-06-30',
    reportedDate: '2023-06-15',
    compBioCompletedDate: '2023-06-20',
    analysisStartedDate: '2023-06-10',
    specimenReceivedDate: '2023-06-05',
    orderStatus: 'in-progress',
    subjectId: 'SUB001',
    reportEta: 'Jul 5',
    sampleId: 'SAMPLE001',
    score: '100',
    tumorScore: '90',
    hasAmendments: false,
    isIHC: false,
    documentDetails: {
      DocumentID: 'doc001',
      DocumentSource: 'CRM'
    },
    serviceRequests: []
  }

  store.loadData(mockData)

  expect(store.trf).toEqual('TRF0001')
  expect(store.type).toEqual('LEGACY/CLIA')
  expect(store.qc).toEqual('dummy qc')
  expect(store.partnerName).toEqual('dummy partner')
  expect(store.site).toEqual('dummy site')
  expect(store.reportAvailable).toEqual('2023-06-01')
  expect(store.reportAvailableValue).toEqual('dummy value')
  expect(store.fileName).toEqual('dummy file')
  expect(store.version).toEqual('v1')
  expect(store.isRead).toEqual(true)
  expect(store.status).toEqual('completed')
  expect(store.isNew).toEqual(false)
  expect(store.updated).toEqual('2023-06-30')
  expect(store.reportedDate).toEqual('2023-06-15')
  expect(store.compBioCompletedDate).toEqual('2023-06-20')
  expect(store.analysisStartedDate).toEqual('2023-06-10')
  expect(store.specimenReceivedDate).toEqual('2023-06-05')
  expect(store.orderStatus).toEqual('in-progress')
  expect(store.subjectId).toEqual('SUB001')
  expect(store.reportEta).toEqual('Jul 5')
  expect(store.sampleId).toEqual('SAMPLE001')
  expect(store.score).toEqual('100')
  expect(store.tumorScore).toEqual('90')
  expect(store.hasAmendments).toEqual(false)
  expect(store.isIHC).toEqual(false)
  expect(store.documentDetails).toEqual({
    requisitionId: 'TRF0001',
    documentId: 'doc001',
    source: 'CRM'
  })
  expect(store.serviceRequests).toEqual([])
})

it('should return the correct report URL', () => {
  store.documentDetails = {
    DocumentSource: 'CRM',
    ParentType: 'Order',
    DocumentID: '3DD5371D-4F1E-E911-A968-000D3A1D777D',
    FileName: 'orderOnline_5c4723489135fe00894561ba.pdf'
  }

  const url = store.getReport({ isDownload: false })

  expect(url).toEqual('/api/v1/pharmaReports/inProgress/report/pdf/%7B%22DocumentSource%22%3A%22CRM%22%2C%22ParentType%22%3A%22Order%22%2C%22DocumentID%22%3A%223DD5371D-4F1E-E911-A968-000D3A1D777D%22%2C%22FileName%22%3A%22orderOnline_5c4723489135fe00894561ba.pdf%22%2C%22isDownload%22%3Afalse%7D')
})

it('should return the correct view URL', () => {
  store.documentDetails = {
    requisitionId: 'TRF0004',
    documentId: 'doc004',
    source: 'CRM'
  }

  expect(store.viewUrl).toEqual(store.getReport({ isDownload: false }))
})

it('should fetch report info and load data correctly', () => {
  const progressTestInfoMock = {
    trf: 'TRF0002',
    templateType: 'LEGACY/CLIA',
    qc: 'dummy qc',
    partnerName: 'dummy partner',
    site: 'dummy site',
    availableDate: 'Jul 01, 2023 12:00 AM',
    availableDateValue: 'dummy value',
    fileName: 'pdfFile',
    version: 'v2',
    isRead: false,
    status: 'in-progress',
    isNew: true,
    updated: '2023-07-01',
    reportedDate: '2023-06-30',
    compBioCompletedDate: '2023-07-05',
    analysisStartedDate: '2023-07-02',
    specimenReceivedDate: '2023-06-28',
    orderStatus: 'submitted',
    subjectNumber: 'SUB002',
    subjectId: 'SUB002',
    reportForecast: {
      forecastDate: 'Jul 01, 2023 12:00 AM'
    },
    externalSpecimenID: 'SAMPLE002',
    score: '95',
    tumorScore: '85',
    hasAmendments: true,
    isIHC: false,
    documentDetails: {
      requisitionId: 'TRF0002',
      documentId: '',
      source: ''
    }
  }

  jest.spyOn(source, 'getInProgressTestInfo').mockResolvedValue(progressTestInfoMock)
  jest.spyOn(store, 'loadData')

  return store.getReportInfo('testId').then(() => {
    expect(source.getInProgressTestInfo).toHaveBeenCalledTimes(1)
    expect(source.getInProgressTestInfo).toHaveBeenCalledWith('testId')
    expect(store.loadData).toHaveBeenCalledTimes(1)
    expect(store.loadData).toHaveBeenCalledWith({
      trf: 'TRF0002',
      type: 'CLIA',
      qc: 'dummy qc',
      partnerName: 'dummy partner',
      site: 'dummy site',
      reportAvailable: dates.getDateOnClientTimeZone('Jul 01, 2023 12:00 AM'),
      reportAvailableValue: 'dummy value',
      fileName: 'pdfFile',
      version: 'v2',
      isRead: false,
      status: 'in-progress',
      isNew: true,
      updated: '2023-07-01',
      reportedDate: '2023-06-30',
      compBioCompletedDate: '2023-07-05',
      analysisStartedDate: '2023-07-02',
      specimenReceivedDate: '2023-06-28',
      orderStatus: 'submitted',
      subject: 'SUB002',
      subjectId: 'SUB002',
      reportEta: 'Jul 1',
      sampleId: 'SAMPLE002',
      score: '95',
      tumorScore: '85',
      hasAmendments: true,
      isIHC: false
    })
  })
})